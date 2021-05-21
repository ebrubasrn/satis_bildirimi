package com.works.satis_bildirimi.DTO;

import com.works.satis_bildirimi.models.Firma;
import com.works.satis_bildirimi.repositories.FirmaRepository;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class FirmaDTO {
    static List<Firma> firmaList = new ArrayList<>();
    final FirmaRepository fRepo ;

    public FirmaDTO(FirmaRepository fRepo) {
        this.fRepo = fRepo;
    }
    public List<Firma> list(){
        firmaList=fRepo.findAll();
        return firmaList;
    }
}
