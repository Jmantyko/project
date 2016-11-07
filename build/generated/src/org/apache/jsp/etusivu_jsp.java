package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import Arjenhallinta.Database;
import Arjenhallinta.InputOutputCleaner;

public final class etusivu_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"style.css\">\r\n");
      out.write("        <title>Arjenhallinta</title>\r\n");
      out.write("        <!-- Bootstrap CDN -->\r\n");
      out.write("        <!-- Latest compiled and minified CSS -->\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\" integrity=\"sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u\" crossorigin=\"anonymous\">\r\n");
      out.write("        <!-- Latest compiled and minified JavaScript -->\r\n");
      out.write("        <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\" integrity=\"sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        ");

            //Fetching data from database
            String content1 = Database.getFrontPageContent(1);
            String content2 = Database.getFrontPageContent(2);
        
      out.write("\r\n");
      out.write("        <h1>Etusivu</h1>\r\n");
      out.write("        <div>\r\n");
      out.write("            ");
      out.print(InputOutputCleaner.clean(content1));
      out.write("<br><br>\r\n");
      out.write("        </div>\r\n");
      out.write("        <form action=\"Login\" method=\"POST\">\r\n");
      out.write("            <label for=\"email\">Sähköpostiosoite:</label>\r\n");
      out.write("            <input type=\"text\" class=\"form-control\" name=\"email\" value=\"\" placeholder=\"Syötä sähköpostiosoite\" /><br>\r\n");
      out.write("            <label for=\"email\">Salasana:</label>\r\n");
      out.write("            <input type=\"password\" class=\"form-control\" name=\"password\" value=\"\" placeholder=\"Syötä salasana\" /><br>\r\n");
      out.write("            <input type=\"submit\" class=\"btn btn-primary\" value=\"Kirjaudu sisään\" />\r\n");
      out.write("        </form><br><br>\r\n");
      out.write("        ");
      out.print(InputOutputCleaner.clean(content2));
      out.write("<br><br>\r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
