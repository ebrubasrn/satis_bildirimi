package com.works.satis_bildirimi.models;

import lombok.Data;

import javax.persistence.*;
import java.util.Set;

@Entity
@Data
public class Firma {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int firmaId;
    private String firmaAdi;
    private String firmaNo;
    private String vergiNo;

    @OneToMany(mappedBy="firma")
    private Set<Satis> satisList;
}
