package com.fmjava.ServiceImpl;

import com.fmjava.DaoImpl.FocusDaoImpl;
import com.fmjava.dao.FocusDao;
import com.fmjava.domain.Focus;
import com.fmjava.service.Focusservice;

import java.util.List;

public class FocusserviceImpl implements Focusservice {
    @Override
    public List<Focus> getAllFocus() {
        FocusDao focusDao=new FocusDaoImpl();
        return focusDao.getAllFocus();
    }

    @Override
    public void deletelFocus(String id) {
        FocusDao focusDao = new FocusDaoImpl();
        focusDao.deletelelelocus(id);
    }

    @Override
    public void addFocus(Focus focus) {
        FocusDao focusDao = new FocusDaoImpl();
        focusDao.addFocus(focus);
    }

    @Override
    public Focus getOneFocus(String id) {
       FocusDao focusDao = new FocusDaoImpl();
       return focusDao.getOneFocus(id);
    }

    @Override
    public void updataFoucs(Focus focus) {
        FocusDao focusDao = new FocusDaoImpl();
        focusDao.updataFoucs(focus);
    }
}
