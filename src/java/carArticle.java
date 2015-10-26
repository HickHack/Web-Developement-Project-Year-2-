/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import javax.xml.transform.dom.DOMSource;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import javax.xml.transform.stream.StreamSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.Transformer;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.xmldb.api.base.*;
import org.xmldb.api.modules.*;
import org.xmldb.api.*;
import javax.xml.transform.OutputKeys;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;

/**
 *
 * @author Graham Murray
 */
@WebServlet(name = "carArticle", urlPatterns = {"/carArticle"})
public class carArticle extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws javax.xml.transform.TransformerConfigurationException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, TransformerConfigurationException {
        response.setContentType("text/html;charset=UTF-8");

        PrintWriter out = response.getWriter();

        try {


            /* Path XSL Files */
            String XSLFile = getServletContext().getRealPath("/data/carArticle.xsl");

            String URI = "xmldb:exist://localhost:8444/exist/xmlrpc";
            String driver = "org.exist.xmldb.DatabaseImpl";

            XMLResource res = null;
            Node resNode = null;
            Document doc = null;

            String path = getServletContext().getRealPath("/");
            String XSLFileName = path + "carArticle.xsl";

            String vehicleParam;

            String name;
            String manufacturer;
            String engineSize;
            String topSpeed;
            String bhp;
            try {
                vehicleParam = request.getParameter("title");
                name = request.getParameter("name");
                manufacturer = request.getParameter("manufacturer");
                engineSize = request.getParameter("engineSize");
                topSpeed = request.getParameter("topSpeed");
                bhp = request.getParameter("bhp");
                if (vehicleParam == null) {
                    vehicleParam = "";
                }
                if (name == null) {
                    name = "";
                }
                if (manufacturer == null) {
                    manufacturer = "";
                }
                if (engineSize == null) {
                    engineSize = "";
                }
                if (topSpeed == null) {
                    topSpeed = "";
                }
                if (bhp == null) {
                    bhp = "";
                }
            } catch (Exception e) {
               vehicleParam = "";
                name = "";
                manufacturer = "";
                engineSize = "";
                topSpeed = "";
                bhp = "";
            }

            try {
                Class cl = Class.forName(driver);
                Database database = (Database) cl.newInstance();
                DatabaseManager.registerDatabase(database);

                // get the collection
                Collection col = DatabaseManager.getCollection(URI + "/db/Wiki");

                XQueryService service = (XQueryService) col.getService("XQueryService", "1.0");
                XQueryService one = (XQueryService) col.getService("XQueryService", "1.0");
                XQueryService two = (XQueryService) col.getService("XQueryService", "1.0");
                XQueryService three = (XQueryService) col.getService("XQueryService", "1.0");
                XQueryService four = (XQueryService) col.getService("XQueryService", "1.0");
                service.setProperty("indent", "yes");
                one.setProperty("indent", "yes");
                two.setProperty("indent", "yes");
                three.setProperty("indent", "yes");
                four.setProperty("indent", "yes");
                String queryString = "";
                
                if (!(name.equals(""))) {
                    service.declareVariable("name", "");
                    queryString = "for $name in //parameter[text()='" +vehicleParam+ "']/../../v:name "
                            + "return update replace $name with <v:name>"+name+"</v:name>";
                   service.query(queryString);
                }
                if (!(manufacturer.equals(""))) {
                    service.declareVariable("manufacturer", "");
                    queryString = "for $manufacturer in //parameter[text()='" +vehicleParam+ "']/../../v:manuacturer "
                            + "return update replace $manufacturer with <v:manuacturer>"+manufacturer+"</v:manuacturer>";
                   one.query(queryString);
                }
                if (!(engineSize.equals(""))) {
                    service.declareVariable("engineSize", "");
                    queryString = "for $engineSize in //parameter[text()='" +vehicleParam+ "']/../../b:engineSize "
                            + "return update replace $engineSize with <v:engineSize>"+engineSize+"</v:engineSize>";
                   two.query(queryString);
                }
                if (!(topSpeed.equals(""))) {
                    service.declareVariable("topSpeed", "");
                    queryString = "for $topSpeed in //parameter[text()='" +vehicleParam+ "']/../../v:topSpeed"
                            + "return update replace $topSpeed with <v:topSpeed>"+topSpeed+"</v:topSpeed>";
                   three.query(queryString);
                }
                if (!(bhp.equals(""))) {
                    service.declareVariable("bhp", "");
                    queryString = "for $bhp in //parameter[text()='" +vehicleParam+ "']/../../v:bhp "
                            + "return update replace $bhp with <v:bhp>"+bhp+"</v:bhp>";
                   four.query(queryString);
                }
        
                
                col.setProperty(OutputKeys.INDENT, "no");
                res = (XMLResource) col.getResource("cars.xml");

                resNode = res.getContentAsDOM();

                doc = (Document) resNode;

            } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | XMLDBException e) {
                System.err.println("Error Document: " + e.getMessage());
            }
            DOMSource origDocSource = new DOMSource(doc);

            try {
                DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
                //Always turn on namespace awareness 
                dbf.isNamespaceAware();
                DocumentBuilder db = dbf.newDocumentBuilder();

            } catch (ParserConfigurationException e) {
                out.println("<h1>Error at " + request.getContextPath() + "/carArticle" + " doc builder" + e.getMessage() + "</h1>");
            }

            // Identify Sources
            DOMSource XMLSource = new DOMSource(doc);
            StreamSource XSLSource = new StreamSource(XSLFile);

            // byte stream output to result
            StreamResult html = new StreamResult(out);

            // Create TransformerFactory
            TransformerFactory factory = TransformerFactory.newInstance();

            // Create Transformer
            Transformer transformer = factory.newTransformer(XSLSource);

            // Get Navigation Info
            NodeList eventNodeList = doc.getElementsByTagName("v:vehicle");
            int num_events = eventNodeList.getLength();
            String prev_name;
            String next_name;

            //Loop to iterate over each name node
            for (int i = 0; i < num_events; i++) {

                Node eventNode = eventNodeList.item(i);

                NodeList eventNodeListChildren = eventNode.getChildNodes();
                Node eventNameNode = eventNodeListChildren.item(1);
                Node nameTextNode = eventNameNode.getChildNodes().item(0);
                String eventNameValue = nameTextNode.getNodeValue();

                if (vehicleParam.equals(eventNameValue)) {

                    if (i != 0) {
                        prev_name = eventNodeList.item(i - 1).getChildNodes().item(1).getChildNodes().item(0).getNodeValue();
                    } else {
                        prev_name = eventNodeList.item(num_events - 1).getChildNodes().item(1).getChildNodes().item(0).getNodeValue();
                    }

                    if (i != (num_events - 1)) {
                        next_name = eventNodeList.item(i + 1).getChildNodes().item(1).getChildNodes().item(0).getNodeValue();
                    } else {
                        next_name = eventNodeList.item(0).getChildNodes().item(1).getChildNodes().item(0).getNodeValue();
                    }

                    transformer.setParameter("currentArticle", eventNameValue);
                    transformer.setParameter("nextArticle", next_name);
                    transformer.setParameter("prevArticle", prev_name);

                }
            }

            transformer.transform(XMLSource, html);

        } catch (TransformerConfigurationException ex) {

            out.println("<h1>Error at " + request.getContextPath() + "/carArticle" + " TransformerConfigurationException Line 125 " + ex.getMessage() + "</h1>");

        } catch (TransformerException ex) {

            out.println("<h1>Error at " + request.getContextPath() + "/carArticle" + " TransformerException Line 127 " + ex.getMessage() + "</h1>");

        } finally {
            //Close byte stream
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (TransformerConfigurationException ex) {
            Logger.getLogger(bikeArticle.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (TransformerConfigurationException ex) {
            Logger.getLogger(bikeArticle.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
