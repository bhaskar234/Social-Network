/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package st;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import javax.servlet.http.HttpSession;
import st.DAO;
import st.loginform;

/**
 *
 * @author balaji
 */
public class loginaction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    
    private static final String SUCCESS = "loginsuccess";
    private static final String FAIL = "loginfail";

    /**
     * This is the action called from the Struts framework.
     * @param mapping The ActionMapping used to select this instance.
     * @param form The optional ActionForm bean for this request.
     * @param request The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     * @throws java.lang.Exception
     * @return
     */
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        loginform frm=(loginform)form;
        List<String> userdetails=new ArrayList<String>();
        userdetails =DAO.IsLogged(frm);
        String uname=null,name=null;
        int i=0;
        for(String a:userdetails)
        {
            i++;
            if(i==1)
            uname=a;
            else if(i==2)
                name=a;
        }
        if(uname!=null)
        {
            HttpSession session = request.getSession();
            session.setAttribute("name", name);
            session.setAttribute("uname", uname);
            System.out.print("Name : "+name);
            System.out.print("Name frm session: "+session.getAttribute("name"));
            return mapping.findForward(SUCCESS);
        
        } 
        else
        {
            
            request.setAttribute("message", "Login failed from LOGINACTION");
            return mapping.findForward(FAIL);
        }
    } 
}
