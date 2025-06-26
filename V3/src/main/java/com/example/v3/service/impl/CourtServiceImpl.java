package com.example.v3.service.impl;

import com.example.v3.mapper.CourtMapper;
import com.example.v3.pojo.Court;
import com.example.v3.service.CourtService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CourtServiceImpl implements CourtService {

    @Autowired
    private CourtMapper courtMapper;

    @Override
    public List<Court> findAll() {
        return courtMapper.findAll();
    }

    @Override
    public Court findById(Integer id) {
        return courtMapper.findById(id);
    }

    @Override
    public List<Court> findByStatus(String status) {
        return courtMapper.findByStatus(status);
    }

    @Override
    public boolean createCourt(Court court) {
        return courtMapper.insert(court) > 0;
    }

    @Override
    public boolean updateCourt(Court court) {
        return courtMapper.update(court) > 0;
    }

    @Override
    public boolean deleteById(Integer id) {
        return courtMapper.deleteById(id) > 0;
    }

    @Override
    public boolean isAvailable(Integer id) {
        Court court = courtMapper.findById(id);
        return court != null && "available".equals(court.getStatus());
    }
} 