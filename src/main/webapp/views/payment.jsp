<%-- 
    Document   : payment
    Created on : Feb 24, 2025, 6:02:12 PM
    Author     : MSI2022
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>



<!-- Modal -->
<div class="modal fade" id="napTienModal" tabindex="-1" aria-labelledby="napTienLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header text-center border-0">
        <h5 class="modal-title w-100 text-orange fw-bold">Nạp tiền</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <ul class="nav nav-tabs justify-content-center mb-3" id="myTab" role="tablist">
          <li class="nav-item" role="presentation">
            <button class="nav-link active" id="thecao-tab" data-bs-toggle="tab" data-bs-target="#thecao" type="button" role="tab">Nạp thẻ cào</button>
          </li>
          <li class="nav-item" role="presentation">
            <button class="nav-link" id="atm-tab" data-bs-toggle="tab" data-bs-target="#atm" type="button" role="tab">ATM tự động</button>
          </li>
        </ul>
        <div class="tab-content" id="myTabContent">
          <div class="tab-pane fade show active" id="thecao" role="tabpanel">
            <form>
              <div class="mb-3">
                <label class="form-label">Nhà cung cấp</label>
                <select class="form-select">
                  <option>VIETTEL</option>
                  <option>MOBIFONE</option>
                  <option>VINAPHONE</option>
                </select>
              </div>
              <label class="form-label">Chọn mệnh giá</label>
              <div class="d-flex flex-wrap gap-2 mb-3">
                <button type="button" class="btn btn-outline-secondary">10,000<br><small>Nhận 100%</small></button>
                <button type="button" class="btn btn-outline-secondary">20,000<br><small>Nhận 100%</small></button>
                <button type="button" class="btn btn-outline-secondary">30,000<br><small>Nhận 100%</small></button>
                <button type="button" class="btn btn-outline-secondary">50,000<br><small>Nhận 100%</small></button>
                <button type="button" class="btn btn-outline-secondary">100,000<br><small>Nhận 100%</small></button>
                <button type="button" class="btn btn-outline-secondary">200,000<br><small>Nhận 100%</small></button>
                <button type="button" class="btn btn-outline-secondary">500,000<br><small>Nhận 100%</small></button>
                <button type="button" class="btn btn-outline-secondary">1,000,000<br><small>Nhận 100%</small></button>
                <button type="button" class="btn btn-outline-secondary">300,000<br><small>Nhận 100%</small></button>
              </div>
              <div class="mb-3">
                <label class="form-label">Mã số thẻ</label>
                <input type="text" class="form-control" placeholder="Nhập mã số thẻ của bạn">
              </div>
              <div class="mb-3">
                <label class="form-label">Số sê-ri</label>
                <input type="text" class="form-control" placeholder="Nhập mã số sê-ri trên thẻ">
              </div>
              <div class="mb-3 d-flex align-items-center">
                <div class="flex-grow-1">
                  <label class="form-label">Mã bảo vệ</label>
                  <input type="text" class="form-control" placeholder="Nhập mã bảo vệ">
                </div>
                <div class="ms-2 text-danger fw-bold fs-4">371</div>
              </div>
              <p class="text-danger small">* Chú ý: Nạp thẻ sai mệnh giá mất 100% giá trị thẻ.</p>
              <button type="submit" class="btn btn-warning w-100 fw-bold text-white">Đăng Nhập</button>
            </form>
          </div>
          <div class="tab-pane fade" id="atm" role="tabpanel">
            <p>Chức năng ATM tự động đang được cập nhật.</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
