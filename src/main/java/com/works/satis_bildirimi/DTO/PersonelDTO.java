package com.works.satis_bildirimi.DTO;

import com.works.satis_bildirimi.models.Personel;
import com.works.satis_bildirimi.models.Sube;
import com.works.satis_bildirimi.repositories.PersonelRepository;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class PersonelDTO {
    static public List<Personel> personelList = new ArrayList<>();
    final PersonelRepository pRepo;

    public PersonelDTO(PersonelRepository pRepo) {
        this.pRepo = pRepo;
    }
    public List<Personel> list() {
        personelList = pRepo.findAll();
        return personelList;
    }
}
