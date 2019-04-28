import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.luck.HbaseDao;
/**
 * Created by luckguozi on 2019/4/8.
 */

public class ServletTest extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String pwd =request.getParameter("pwd");

        HbaseDao hd = new HbaseDao();
        System.out.println(pwd);

        //System.out.println(pwd);

        String ses = hd.getDataByRowKey(id);
        //System.out.println(ses);
        String rs =null;
        if(ses.equals(pwd)){
            rs= "1";
        }else {
            rs ="2";
        }
        System.out.println(rs);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        HttpSession session = request.getSession();
        session.setAttribute("name",id);
        int m=1;//菜名从1开始排。。我说怎么都是null
        session.setAttribute("hbaseid",m);
        PrintWriter ps = response.getWriter();
        ps.print(rs);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);

    }
}
