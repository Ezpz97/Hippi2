package net.skhu.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;

import net.skhu.entity.Store;
import net.skhu.model.Pagination;

public interface StoreRepository  extends JpaRepository<Store, Integer> {

    public default List<Store> findAll(Pagination pagination) {
        Page<Store> page = this.findAll(PageRequest.of(pagination.getPg() - 1, pagination.getSz(),
                                           Sort.Direction.ASC, "id"));
        pagination.setRecordCount((int)page.getTotalElements());
        return page.getContent();
    }

    Page<Store> findByLocationId(int locationId, Pageable pageable);

    public default List<Store> findByLocationId(Pagination pagination) {
        if (pagination.getLi() == 0) return findAll(pagination);
        Page<Store> page = this.findByLocationId(pagination.getLi(),
                PageRequest.of(pagination.getPg() - 1, pagination.getSz(), Sort.Direction.ASC, "id"));
        pagination.setRecordCount((int)page.getTotalElements());
        return page.getContent();
    }
}

