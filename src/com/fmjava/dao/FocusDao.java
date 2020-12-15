package com.fmjava.dao;

import com.fmjava.domain.Focus;

import java.util.List;

public interface FocusDao {
    public List<Focus> getAllFocus();

   public void deletelelelocus(String id);

    public void addFocus(Focus focus);

    Focus getOneFocus(String id);

    void updataFoucs(Focus focus);
}
