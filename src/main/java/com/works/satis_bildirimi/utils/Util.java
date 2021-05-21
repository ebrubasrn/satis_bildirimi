package com.works.satis_bildirimi.utils;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

@Service
public class Util {
    @Autowired
    final HttpServletRequest request;


    public Util(HttpServletRequest request) {
        this.request = request;
    }

    public String control( String page ) {

        boolean status = request.getSession().getAttribute("kullanici") == null;
        if ( !status ) {
            return page;
        }

        return "redirect:/";
    }
    public String logout() {

        // all session remove
        request.getSession().invalidate();
        return "redirect:/";
    }
    public String converMd5(String text){
        return "";    }
}
