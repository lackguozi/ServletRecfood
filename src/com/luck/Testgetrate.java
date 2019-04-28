package com.luck;

import java.io.IOException;

/**
 * Created by luckguozi on 2019/4/14.
 */
public class Testgetrate {
     public static void main(String[] args) {
         HbaseDao mm =new HbaseDao();
         String f=null;
         try {
              f =mm.getrate("18000");
         }catch (IOException e){
             e.printStackTrace();
         }
         System.out.println(f);

    }
}
