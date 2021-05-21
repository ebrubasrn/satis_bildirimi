package com.works.satis_bildirimi.models;

import lombok.Data;
import lombok.Generated;

import javax.persistence.*;
import java.util.Set;

@Entity
@Data
public class Sube {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private int subeId;
    private String subeKodu;
    private String subeAdi;

    @OneToMany(mappedBy="sube")
    private Set<Personel> personelList;
}
