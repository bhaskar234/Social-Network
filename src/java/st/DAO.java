/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package st;
import st.registerform;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class DAO {

    public static String register(registerform sform)
    {
        try
        {
            Connection con=Database.getConnection();
            if(con==null)
                return "Error :Connection to database failed";
            Statement st=con.createStatement();

            PreparedStatement ps=con.prepareStatement("insert into fbreg values(?,?,?)");
            ps.setString(1,sform.getUname());
            ps.setString(2,sform.getPwd());
            ps.setString(3,sform.getName());
            int count=ps.executeUpdate();
            con.close();
            if(count==1)
                return null;
            else
                return "Registration failed";

        }
        catch(Exception ex)
        {
            System.out.println("Registration error : "+ex);
            return ex.getMessage();

        }
    } //end of  method

    public static List<String> IsLogged(loginform sform)
    {
        String name=null,uname=null;
        List<String> list=new ArrayList<String>();
        try
          {
            String str="select uname,name from fbreg where uname='"+sform.getUname()+"' and  pwd='"+sform.getPwd()+"'";
            System.out.println("Query : "+str);
            Connection con=Database.getConnection();
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery(str);
            while(rs.next())
            {
                if(rs.getString(1)!=null)
                {
                    uname=rs.getString(1);
                    name=rs.getString(2);
                    list.add(uname);
                    list.add(name);
                }
                else
                    return list;

            }

        }
        catch(Exception ex)
        {
            System.out.println("Login error : "+ex);
            return null;
        }
        return list;
    }
    public static ArrayList<showusers> getNames()
    {
        ArrayList<showusers> list=new ArrayList<showusers>();
        try
        {
            Connection con=Database.getConnection();
            Statement st=con.createStatement();
            String query = "select name,uname from fbreg";
            ResultSet rs=st.executeQuery(query);
            while(rs.next())
            {
                showusers s=new showusers();
                s.setName(rs.getString(1));
                s.setUname(rs.getString(2));
               list.add(s);

            }
        }
        catch(Exception ex)
        {
            System.out.println("Error from getNames() in DAO");
            return null;
        }
        return list;
    }
    public static String[] addfriend(String fromuname,String touname)

    {
        String ret[]=new String[2];
        //boolean added=false;
        try
        {
            Connection con=Database.getConnection();
            if(con==null)
            {
                 ret[0]="no";

                 ret[1]="error";
                 return ret;

            }
            Statement st=con.createStatement();
            String query="select count(*) from friends where reqfrom='"+fromuname+"' and reqto='"+touname+"'";
            ResultSet rs=st.executeQuery(query);
            while(rs.next())
             {
                  if(rs.getInt(1)==0)
                   {
                       ret[0]="no"; //alreadyadded=no




		 System.out.println("Friend request not previously sent");
				   }
				   else
				   {
                                       ret[0]="yes";
					   System.out.println("Friend request already sent");
					  // return false;
				   }
			 }
            if(ret[0]=="yes")
            {
              ret[1]="noerror";
            }
            else
            {
            PreparedStatement ps=con.prepareStatement("insert into friends values(?,?,?)");
            ps.setString(1,fromuname);
            ps.setString(2,touname);
            ps.setString(3,"false");
            int count=ps.executeUpdate();

            if(count==1)
            {
                //added=true;
                ret[1]="noerror"; //no error in adding friend
                //return true;
            }
            else
            {
                ret[1]="error"; //problem adding friend


                //return false;
            }
            } //end of else
        return ret;
        }
        catch(Exception ex)
        {
            System.out.println("Error in adding friend : "+ex);
            return null;
        }
    }
    public static List<String> friendrequests(String touname)
    {
        List<String> list=new ArrayList<String>();
        try
        {
            Connection con=Database.getConnection();
            if(con==null)
                return null;
            Statement st=con.createStatement();
            String query="select reqfrom from friends where reqto='"+touname+"' and confirmed='false'";
            ResultSet rs=st.executeQuery(query);
            while(rs.next())
            {
                list.add(rs.getString(1));
            }
            return list;


        }
        catch(Exception ex)
        {
            System.out.println("Exception from friendsrequests() : "+ex);
            return null;
        }
    }
    public static boolean confirmfriend(String fromuname,String touname)
    {
        try
        {
            Connection con=Database.getConnection();
            Statement st = con.createStatement();
            int count=0;
            count=st.executeUpdate("update friends set confirmed='true' where reqfrom='"+fromuname+"' and reqto='"+touname+"'");
            if(count!=0)
            {
                System.out.println("Friend confirmed");
                return true;
            }
            else
            {
                System.out.println("Error updating table friends , no rows updated");
                return false;
            }
        }
        catch(Exception ex)
        {
            System.out.println("Exception confirmedfriend() : "+ex);
            return false;
        }
    }
    public static List<String> getFriends(String uname)
    {
        List<String> list=new ArrayList<String>();
        try
        {
            Connection con=Database.getConnection();
            Statement st=con.createStatement();
            String query="select reqfrom,reqto from friends where (reqfrom='"+uname+"' or reqto='"+uname+"') and confirmed='true'";
            System.out.println("Friends Query : "+query);
            ResultSet rs=st.executeQuery(query);
            while(rs.next())
            {
                if(rs.getString(1).equals(uname))
                {
                    System.out.println("rs.getString(1) : "+rs.getString(1)+" equals uname : "+uname);
                    list.add(rs.getString(2));
                }
                else
                {
                    System.out.println("rs.getString(1) : "+rs.getString(2)+" equals uname : "+uname);
                    list.add(rs.getString(1));
                }
            }
            return list;
        }
        catch(Exception ex)
        {
            System.out.println("Exception getFriends() : "+ex);
            return list;
        }
    }
    public static boolean sendmessage(String fromuname,String touname,String msg)
    {
        try
        {

            //SimpleDateFormat formatter=  new SimpleDateFormat("mm/dd/yyyy");
           // SimpleDateFormat formatter2=  new SimpleDateFormat("hh:mm:ss");
 //String dateNow = formatter.format(new Date());
// String timeNow=formatter2.format(new Date());
            Connection con=Database.getConnection();
            Statement st=con.createStatement();
            String query="select count(*) from messages";
            ResultSet rs=st.executeQuery(query);
            long rows=0;
            while(rs.next())
            {
                rows=rs.getLong(1);
            }
            PreparedStatement ps=con.prepareStatement("insert into messages values(?,?,?,?,?)");
            ps.setLong(1, rows);
            ps.setString(2,fromuname);
            ps.setString(3,touname);
            ps.setString(4,msg);
            ps.setString(5,new Date().toString());

            int count=0;
            count=ps.executeUpdate();
            if(count!=0)
            {
                System.out.println("Message sent ");
                return true;
            }
            else
            {
                System.out.println("Failed inserting into MESSAGES table");
                return false;
            }


        }
        catch(Exception ex)
        {
            System.out.println("Exception ex : "+ex);
            return false;
        }
    }
    public static ArrayList<List> getInbox(String uname)
    {
        try
        {


            //list.add("sno");
            //list.add("fromuname");
            //list.add("msg");
            ArrayList<List> alist=new ArrayList<List>();
            Connection con=Database.getConnection();
            Statement st=con.createStatement();
            String query="select sno,msgfrom,msg,dtime from messages where msgto='"+uname+"' order by sno";
            ResultSet rs=st.executeQuery(query);
            while(rs.next())
            {
                List<String> list=new ArrayList<String>();

                list.add(rs.getInt(1)+"");
                list.add(rs.getString(2));
                list.add(rs.getString(3));
                list.add(rs.getString(4));
               // for(String a:list)
                  //  System.out.println("List values : "+a);
                alist.add(list);

            }
            return alist;
        }
        catch(Exception ex)
        {
            System.out.println("Exception from getInbox : "+ex);
            return null;
        }
    }
    public static boolean isUnique(String str)
    {
        boolean msg=false;
        try
        {
            Connection con=Database.getConnection();
            if(con==null)
                throw new Exception("Error connecting to database");
            String query="select count(*) from fbreg where uname='"+str+"'";
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery(query);
           // System.out.println("querynextstatement");
            while(rs.next())
            {
              //  System.out.println("inside while");
                if(rs.getInt(1)==0)
                {

                   // System.out.println("56789ghj");
                    msg=true;
                }
                else
                {
                   // System.out.println("1234kid");
                    msg=false;
                }

            }
          //  System.out.println("afterwhile");

        }
        catch(Exception ex)
        {
            System.out.println("error ");
            ex.printStackTrace();

        }
        return msg;
    }


  }//end of class
