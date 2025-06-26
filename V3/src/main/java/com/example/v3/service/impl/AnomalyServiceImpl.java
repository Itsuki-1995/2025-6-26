package com.example.v3.service.impl;

import com.example.v3.mapper.AnomalyMapper;
import com.example.v3.pojo.Anomaly;
import com.example.v3.service.AnomalyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AnomalyServiceImpl implements AnomalyService {

    @Autowired
    private AnomalyMapper anomalyMapper;

    @Override
    public List<Anomaly> findAll() {
        return anomalyMapper.findAllWithDetails();
    }

    @Override
    public List<Anomaly> findByUserId(Integer userId) {
        return anomalyMapper.findByUserId(userId);
    }

    @Override
    public Anomaly findById(Integer id) {
        return anomalyMapper.findById(id);
    }

    @Override
    public boolean createAnomaly(Anomaly anomaly) {
        return anomalyMapper.insert(anomaly) > 0;
    }

    @Override
    public boolean updateStatus(Integer id, String status, String adminResponse) {
        return anomalyMapper.updateStatus(id, status, adminResponse) > 0;
    }

    @Override
    public boolean deleteById(Integer id) {
        return anomalyMapper.deleteById(id) > 0;
    }

    @Override
    public List<Anomaly> findByStatus(String status) {
        return anomalyMapper.findByStatus(status);
    }

    @Override
    public List<Anomaly> findByCourtId(Integer courtId) {
        return anomalyMapper.findByCourtId(courtId);
    }

    @Override
    public List<Anomaly> findByCondition(Integer courtId, String status) {
        return anomalyMapper.findByCondition(courtId, status);
    }
} 