package com.luck;

import java.io.IOException;

/**
 * Created by luckguozi on 2019/4/9.
 */
public class TestgetFood {
     public static void main(String[] args) {
        HbaseDao ss =new HbaseDao();
        Food h =null;
        String m = "11";
        try {
            h=ss.getFoodData(m);
        }catch (IOException e){
            e.printStackTrace();
        }
         //System.out.println(h.getFid());
         System.out.println(h.getName());
         //System.out.println(h.getUrl());
    }

}
