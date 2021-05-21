package com.works.satis_bildirimi.models;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.time.LocalDate;
import java.util.Date;

@Entity
@Data
public class Satis {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int satisId;
    private String islem;



    private LocalDate tarih;

    @ManyToOne
    @JoinColumn(name = "firmaId", nullable = false)
    private Firma firma;

    @ManyToOne
    @JoinColumn(name = "faaliyetAlaniId")
    private FaaliyetAlani faaliyetAlani;

    @OneToOne
    @JoinColumn(name = "basvuruSubeId", nullable = false)
    private Sube basvuruSube;

    @OneToOne
    @JoinColumn(name = "teslimatSubeId", nullable = false)
    private Sube teslimatSube;

    @OneToOne
    @JoinColumn(name = "urunId", nullable = false)
    private Urun urun;

    @OneToOne
    @JoinColumn(name = "sid", nullable = false)
    private SatisSekli satisSekli;


    private int gunlukYatan;
    private int oncekiYatan;
    private int toplamYatan;
    private int gunlukTeslimat;
    private int toplamTeslimat;
    private int teslimatYapilacak;

}
