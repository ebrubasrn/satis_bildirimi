package com.works.satis_bildirimi.DTO;

import com.works.satis_bildirimi.models.FaaliyetAlani;
import com.works.satis_bildirimi.repositories.FaaliyetAlaniRepository;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class FaaliyetAlaniDTO {
    static List<FaaliyetAlani> faaliyetAlaniList = new ArrayList<>();
    final FaaliyetAlaniRepository faRepo;

    public FaaliyetAlaniDTO(FaaliyetAlaniRepository faRepo) {
        this.faRepo = faRepo;
    }

    public List<FaaliyetAlani> list()
    {
        faaliyetAlaniList = faRepo.findAll();
        return faaliyetAlaniList;
    }
}
