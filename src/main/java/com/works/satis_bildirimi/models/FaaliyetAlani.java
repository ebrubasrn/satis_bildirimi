package com.works.satis_bildirimi.models;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
@Data
public class FaaliyetAlani {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int fid;
    private String faaliyetAlani;

}
