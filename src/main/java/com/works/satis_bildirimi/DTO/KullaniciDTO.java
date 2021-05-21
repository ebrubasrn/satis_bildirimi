package com.works.satis_bildirimi.DTO;

import com.works.satis_bildirimi.models.Kullanici;
import com.works.satis_bildirimi.models.Personel;
import com.works.satis_bildirimi.repositories.KullaniciRepository;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class KullaniciDTO {
    final KullaniciRepository kRepo;

    public KullaniciDTO(KullaniciRepository kRepo) {
        this.kRepo = kRepo;
    }

    public Optional<Kullanici> getBySicilNoAndPassword(String sicilNo, String password){
        Optional<Kullanici> kullanici = kRepo.findBySicilNoAndPassword(sicilNo,password);
        return kullanici;
    }
}
