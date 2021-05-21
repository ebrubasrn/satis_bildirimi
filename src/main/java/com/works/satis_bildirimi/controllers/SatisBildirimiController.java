package com.works.satis_bildirimi.controllers;

import com.works.satis_bildirimi.DTO.*;
import com.works.satis_bildirimi.models.*;
import com.works.satis_bildirimi.utils.LocalDateConfig;
import com.works.satis_bildirimi.utils.LocalDatePropertyEditor;
import com.works.satis_bildirimi.utils.Util;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Controller
public class SatisBildirimiController {
    final Util util;
    final SatisDTO sDto;
    final FaaliyetAlaniDTO faDTO;
    final FirmaDTO firmaDTO;
    final SubeDTO subeDTO;
    final UrunDTO urunDTO;
    final SatisSekliDTO satisSekliDTO;
    final HttpServletRequest request;
    private LocalDate date;
    private int sId;
    static Sube teslimatSube;


    public SatisBildirimiController(Util util, SatisDTO sDto,
                                    FaaliyetAlaniDTO faDTO, FirmaDTO firmaDTO,
                                    SubeDTO subeDTO, UrunDTO urunDTO, SatisSekliDTO satisSekliDTO, HttpServletRequest request) {
        this.util = util;
        this.sDto = sDto;
        this.faDTO = faDTO;
        this.firmaDTO = firmaDTO;
        this.subeDTO = subeDTO;
        this.urunDTO = urunDTO;
        this.satisSekliDTO = satisSekliDTO;
        this.request = request;
    }
    boolean status = false;
    boolean edit = false;
    int kayit =0;
    int sil=0;
    String islemMesaj="";
    String error="";
    Kullanici kullanici;
    @GetMapping("/satisbildirimi")
    public String satisbildirimi(Model model) {
        if(request.getSession().getAttribute("kullanici") instanceof Kullanici) {
            kullanici = (Kullanici) request.getSession().getAttribute("kullanici");
            teslimatSube = kullanici.getPersonel().getSube();
            try {
                if(date!=null){
                    List<Satis> satisList = sDto.getSatisList(date,teslimatSube);
                    model.addAttribute("satisList", satisList);
                    if(sId!=0)
                    {
                        model.addAttribute("satisList", satisList);
                        Optional<Satis> optionalSatis=sDto.getSatisById(sId);
                        Satis satis = optionalSatis.get();
                        model.addAttribute("satis",satis);

                    }
                }

                List<FaaliyetAlani> faaliyetAlaniList = faDTO.list();
                List<Firma> firmaList = firmaDTO.list();
                List<Sube> subeList = subeDTO.list();
                List<Urun> urunList = urunDTO.list();
                List<SatisSekli> satisSekliList = satisSekliDTO.list();

                List<SatisTarih> satisTarihList = sDto.getDistinctTarih(teslimatSube);
                model.addAttribute("kayit", kayit);
                kayit=0;
                model.addAttribute("sil", sil);
                sil=0;
                model.addAttribute("error", error);
                error="";
                model.addAttribute("kayitMesaj", islemMesaj);
                islemMesaj="";
                model.addAttribute("tarihList", satisTarihList);
                model.addAttribute("faaliyetAlaniList",faaliyetAlaniList);
                model.addAttribute("firmaList",firmaList);
                model.addAttribute("subeList",subeList);
                model.addAttribute("urunList",urunList);
                model.addAttribute("satisSekliList",satisSekliList);
                model.addAttribute("kullanici",kullanici);

            }catch (Exception ex){
                System.out.println(ex);
            }
        }
        return util.control("satisbildirimi");
    }

    @GetMapping("/getSatisList/{tarih}")
    public String getSatisList(@PathVariable String tarih) {

        try {
            date = LocalDate.parse(tarih);
        }catch (Exception ex) {
            System.out.println(ex);
        }
        //util.logout();
       return "redirect:/satisbildirimi";
        //return util.control("satisbildirimi");
    }
    @GetMapping("/getSatisById/{satisId}")
    public String getSatisById(@PathVariable String satisId) {

        try {
            sId = Integer.parseInt(satisId);
            edit = true;

        }catch (Exception ex) {
            System.out.println(ex);
        }

        return "redirect:/satisbildirimi";

    }
    @GetMapping("/satisSil/{satisId}")
    public String satisSil(@PathVariable String satisId) {

        try {
            int convertSatisId= Integer.parseInt(satisId);
            sDto.sil(convertSatisId);
            sil=1;
            islemMesaj="Kayıt Silindi";
            return "redirect:/satisbildirimi";
        }catch (Exception ex) {
            sil=2;
            islemMesaj="Kayıt Silinemedi";
            error=ex.toString();
        }
        //util.logout();
        return util.control("satisbildirimi");

    }

    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        DateTimeFormatter fmt = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        //binder.registerCustomEditor(LocalDate.class, new CustomDateEditor(fmt, false));
        binder.registerCustomEditor(LocalDate.class, new LocalDatePropertyEditor());

    }


    @PostMapping("/satisKayit")
    public String satisKayit(@Valid Satis satis, BindingResult br, Model m) {

            if(br.hasErrors())
            {
                error=br.getAllErrors().toString();

            }
            else
            {

            }
        if ( sDto.save(satis) != null ){
            status = true;
            kayit=1;
            islemMesaj="Kayıt Başarılı";
            return "redirect:/satisbildirimi";
        }
        else{
            islemMesaj="Kayıt Başarısız";
            kayit=2;
        }
        return util.control("satisbildirimi");
    }
    @GetMapping("/logout")
    public String logout(Model model) {
        date=null;
        return util.logout();
    }
}
