package com.luck;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * Created by luckguozi on 2019/4/11.
 */
public class getTest {
    public static void main(String[] args) {
        HbaseDao mm = new HbaseDao();
        int f =5;
        List res =null;
        try {
             res = mm.getAllName(f);
        }catch (IOException e){
            e.printStackTrace();
        }
        Iterator ff =res.iterator();
        while (ff.hasNext()){
            System.out.println(ff.next());
        }

    }

}
