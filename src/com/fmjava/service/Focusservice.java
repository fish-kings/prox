package com.fmjava.service;

import com.fmjava.domain.Focus;

import java.util.List;

public interface Focusservice {
    public List<Focus> getAllFocus();

    public void deletelFocus(String id);

   public void addFocus(Focus focus);

    public Focus getOneFocus(String id);

    void updataFoucs(Focus focus);
}
