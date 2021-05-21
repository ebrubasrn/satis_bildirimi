package com.works.satis_bildirimi.DTO;

import com.works.satis_bildirimi.models.SatisSekli;
import com.works.satis_bildirimi.repositories.SatisSekliRepository;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class SatisSekliDTO {
    final SatisSekliRepository ssRepo;
    static List<SatisSekli> satisSekliList = new ArrayList<>();
    public SatisSekliDTO(SatisSekliRepository ssRepo) {
        this.ssRepo = ssRepo;
    }
    public List<SatisSekli> list(){
        satisSekliList = ssRepo.findAll();
        return satisSekliList;
    }
}
