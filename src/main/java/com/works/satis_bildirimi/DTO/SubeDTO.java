package com.works.satis_bildirimi.DTO;

import com.works.satis_bildirimi.models.Sube;
import com.works.satis_bildirimi.repositories.SubeRepository;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Service
public class SubeDTO {

    static public List<Sube> subeList = new ArrayList<>();
    final SubeRepository sRepo;

    public SubeDTO(SubeRepository sRepo) {
        this.sRepo = sRepo;
    }

    public List<Sube> list() {
        subeList = sRepo.findAll();
        return subeList;
    }
}
