package com.works.satis_bildirimi.models;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
@Data
public class Urun {
    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private int urunId;
    private String urunKodu;
    private String grupKodu;
    private String urunAdi;
    private String stokTuru;
}
