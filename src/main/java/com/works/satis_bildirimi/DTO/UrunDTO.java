package com.works.satis_bildirimi.DTO;

import com.works.satis_bildirimi.models.Sube;
import com.works.satis_bildirimi.models.Urun;
import com.works.satis_bildirimi.repositories.UrunRepository;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class UrunDTO {
    static public List<Urun> urunList = new ArrayList<>();
    final UrunRepository uRepo;

    public UrunDTO(UrunRepository uRepo) {
        this.uRepo = uRepo;
    }

    public List<Urun> list() {
        urunList = uRepo.findAll();
        return urunList;
    }
}
