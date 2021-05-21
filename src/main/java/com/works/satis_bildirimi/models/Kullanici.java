package com.works.satis_bildirimi.models;

import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;

@Entity
@Data
public class Kullanici {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int kullaniciId;
    @NotEmpty( message= "Isim bos bırakılamaz.")
    private String sicilNo;
    @NotEmpty( message= "Şifre bos bırakılamaz.")
    private String password;
    private boolean status;

    @OneToOne
    @JoinColumn(name = "personelId", nullable = false)
    private Personel personel;
}
