package com.yzf.controller;

/**
 * Author:yzf
 * Date:2019/11/4,17:36
 * project_name:xmwk
 **/
public class Stack {


    public static class te1{
        public te1() {
            System.out.println("this is te1----");
        }
    }

    public static class te2{
        public te2() {
            System.out.println("this is te2----");
        }
    }

    public static void main(String[] args) {

        te1 t=new te1();
        te2 t2=new te2();
        System.out.println("this is end----");

         int[] i=new int[2];
         i[0]=1;
         i[1]=2;
         i[2]=3;

    }

}
