import com.luck.HbaseDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by luckguozi on 2019/4/21.
 */
@WebServlet(name = "RegServlet",urlPatterns={"/reg.action"})
public class RegServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String pwd = request.getParameter("pwd");
        String res =null;
        HbaseDao reg =new HbaseDao();
        Integer m = reg.regdata(id,pwd);
        System.out.println(m);
        if(m==1||m.equals(1)){
            res="1";
        }else {
            res="0";
        }
        System.out.println(res);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter ps = response.getWriter();
        ps.print(res);



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
