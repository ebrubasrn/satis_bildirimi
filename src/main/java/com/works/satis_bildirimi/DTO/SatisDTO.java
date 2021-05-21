package com.works.satis_bildirimi.DTO;

import com.works.satis_bildirimi.models.Satis;
import com.works.satis_bildirimi.models.Sube;
import com.works.satis_bildirimi.repositories.SatisRepository;
import com.works.satis_bildirimi.models.SatisTarih;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class SatisDTO {
    final SatisRepository sRepo;

    public SatisDTO(SatisRepository sRepo) {
        this.sRepo = sRepo;
    }
    public List<SatisTarih> getDistinctTarih(Sube teslimatSube){

        List<SatisTarih> tarihList = sRepo.GetDistinctSatisTarih(teslimatSube);
        return tarihList;
    }
    public List<Satis> getSatisList(LocalDate date, Sube teslimatSube){
        List<Satis> satisList = sRepo.findByTarihAndTeslimatSube(date, teslimatSube);
        return satisList;
    }
    public Optional<Satis> getSatisById(int Id){
        return sRepo.findById(Id);
    }

    public void sil(int id){
        sRepo.deleteById(id);
    }
    public Satis save(Satis satis){
        return sRepo.save(satis);
    }
    public Satis update(Satis satis){
        return sRepo.saveAndFlush(satis);
    }
}
