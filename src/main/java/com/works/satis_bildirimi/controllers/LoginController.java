package com.works.satis_bildirimi.controllers;

import com.works.satis_bildirimi.DTO.KullaniciDTO;
import com.works.satis_bildirimi.models.Kullanici;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;
import java.util.Optional;

@Controller
public class LoginController {



    final KullaniciDTO kDTO;
    final HttpServletRequest req;

    String error = "";
    int giris=0;

    public LoginController(KullaniciDTO kDTO, HttpServletRequest req) {
        this.kDTO = kDTO;
        this.req = req;
        //req.getSession().invalidate();
    }


    @GetMapping({"", "/"})
    public String login(Model model) {
        //req.getSession().invalidate();
        if ( !error.equals("") ) {
            model.addAttribute("error", error);
            model.addAttribute("login", giris);
            giris=0;
            error = "";
        }
        return "login";
    }


    @PostMapping("/login")
    public String login(@Valid Kullanici kullanici, BindingResult result, Model m) {
        if(result.hasErrors()){
           List<ObjectError> objErrList = result.getAllErrors();
            for (ObjectError objErr:objErrList
                 ) {error+=objErr.getDefaultMessage();
            }
        }
        else{
                Optional<Kullanici> opt = kDTO.getBySicilNoAndPassword(kullanici.getSicilNo(),kullanici.getPassword());
                if (opt.isPresent()) {
                    req.getSession().setAttribute("kullanici", opt.get());
                    giris=1;
                    return "redirect:/satisbildirimi";

                } else {
                    giris=2;
                    error = "Kullanıcı Adı veya Şifre Hatalı";
                }
            }
        return "redirect:/";
    }
}
