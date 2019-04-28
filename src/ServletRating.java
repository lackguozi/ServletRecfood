import com.luck.Hbase;
import org.apache.hadoop.hbase.client.Get;
import org.apache.hadoop.hbase.util.Bytes;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by luckguozi on 2019/4/10.
 */
//处理评分
@WebServlet(name = "ServletRating",urlPatterns={"/rate.action"})
public class ServletRating extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession se =request.getSession();
        String fid = request.getParameter("fid");
        String rate = request.getParameter("rate");
        String id = (String)se.getAttribute("name");
        System.out.println(id);
        if(id==null||id.equals("")){
            return;
        }
        String time =Long.toString(System.currentTimeMillis());
        String res=null;
        //这个rating表中的数据不需要查询，所以rowkey值准备根据时间戳设置
        //rowkey设置在hbase中是很重要的。并发可能会出问题先做个检测是否已经存在
        //Hbase.getInstance().getTable("rating");
        
        Get get = new Get(Bytes.toBytes(time));
        //这个检测是否存在实际没什么作用
        if (!get.isCheckExistenceOnly()) {
            Hbase.getInstance().put("rating", time, "info", "uid", id);
            Hbase.getInstance().put("rating", time, "info", "fid", fid);
            Hbase.getInstance().put("rating", time, "info", "rating", rate);
            res ="1";
        }
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter ps = response.getWriter();
        ps.print(res);


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
