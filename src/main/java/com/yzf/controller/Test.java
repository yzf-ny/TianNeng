package com.yzf.controller;

import java.util.HashSet;
import java.util.Set;

/**
 * Author:yzf
 * Date:2019/11/4,17:36
 * project_name:xmwk
 **/
public class Test {
    public static void main(String[] args) {

        Set<Integer> set=new HashSet<>();
        set.add(1);
        set.add(2);
        set.add(3);
        for (Integer ie:set)
        {
            System.out.println(ie.intValue());
        }
    }
}
