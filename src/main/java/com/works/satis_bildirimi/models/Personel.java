package com.works.satis_bildirimi.models;

import lombok.Data;

import javax.persistence.*;
import java.util.Set;

@Entity
@Data
public class Personel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int personelId;
    private String sicilNo;
    private String ad;
    private String soyad;

    @ManyToOne
    @JoinColumn(name = "subeId", nullable = false)
    private Sube sube;

    @ManyToMany
    @JoinTable(
            name = "PERSONELROL",
            joinColumns = @JoinColumn(name = "personelId"),
            inverseJoinColumns = @JoinColumn(name = "rolId"))
    Set<Rol> rolList;
}
