import React, { forwardRef, useRef } from "react";
import swal from "sweetalert";
import { DeleteOutline, Edit } from "@material-ui/icons";
import {Button}  from "../../../components/CustomControl/Button";

import CustomTable from "components/CustomTable/CustomTable";
import { apiCall, apiOption , LoginUserInfo, language} from "../../../actions/api";
import ExecuteQueryHook from "../../../components/hooks/ExecuteQueryHook";

import ProductAddEditModal from "./ProductAddEditModal";

const Product = (props) => {
  const serverpage = "product"; // this is .php server page

  const permissionType = props.permissionType;
  const { useState } = React;
  const [bFirst, setBFirst] = useState(true);
  const [currentRow, setCurrentRow] = useState([]);
  const [showModal, setShowModal] = useState(false); //true=show modal, false=hide modal
  
  const {isLoading, data: dataList, error, ExecuteQuery} = ExecuteQueryHook(); //Fetch data
  const UserInfo = LoginUserInfo();
  /* =====Start of Excel Export Code==== */
  const EXCEL_EXPORT_URL = process.env.REACT_APP_API_URL;

  const PrintPDFExcelExportFunction = (reportType) => {
    let finalUrl = EXCEL_EXPORT_URL + "report/print_pdf_excel_server.php";

    window.open(
      finalUrl +
        "?action=ProductExport" +
        "&reportType=excel" +
        "&ClientId=" + UserInfo.ClientId +
        "&BranchId=" + UserInfo.BranchId +
        "&TimeStamp=" +
        Date.now()
    );
  };
  /* =====End of Excel Export Code==== */

  const columnList = [
    { field: "rownumber", label: "SL", align: "center", width: "5%" },
    {
      field: "CategoryName",
      label: "Category Name",
      width:'15%',
      align: "left",
      visible: true,
      sort: true,
      filter: true,
    },
    {
      field: "ProductCode",
      label: "Product Code",
      width:'10%',
      align: "left",
      visible: true,
      sort: true,
      filter: true,
    },
    {
      field: "ProductName",
      label: "Product Full Name",
      align: "left",
      visible: true,
      sort: true,
      filter: true,
    },
        {
      field: "ProductShortName",
      label: "Product Short Name",
      align: "left",
      visible: true,
      sort: true,
      filter: true,
    },
            {
      field: "Price",
      label: "Price",
      align: "right",
      visible: true,
      sort: true,
      filter: true,
      width: "8%",

    },
      {
      field: "custom",
      label: "Action",
      width: "7%",
      align: "center",
      visible: true,
      sort: false,
      filter: false,
    },
  ];

  
  if (bFirst) {
    /**First time call for datalist */
    getDataList();
    setBFirst(false);
  }

  /**Get data for table list */
  function getDataList(){

    let params = {
      action: "getDataList",
      lan: language(),
      UserId: UserInfo.UserId,
      ClientId: UserInfo.ClientId,
      BranchId: UserInfo.BranchId,
    };
    // console.log('LoginUserInfo params: ', params);

    ExecuteQuery(serverpage, params);
  }

  /** Action from table row buttons*/
  function actioncontrol(rowData) {
    return (
      <>
        {permissionType === 0 && (<Edit
          className={"table-edit-icon"}
          onClick={() => {
            editData(rowData);
          }}
        />)}

{permissionType === 0 && (<DeleteOutline
          className={"table-delete-icon"}
          onClick={() => {
            deleteData(rowData);
          }}
        />)}
      </>
    );
  }

  const addData = () => {

    setCurrentRow({
            id: "",
            ProductCategoryId: "",
            ProductCode: "",
            ProductName: "",
            ProductShortName: "",
            Price: "",
          });
    openModal();
  };

  const editData = (rowData) => {

    setCurrentRow(rowData);
    openModal();
  };

  
  function openModal() {
    setShowModal(true); //true=modal show, false=modal hide
  }

  function modalCallback(response) {
    getDataList();
    setShowModal(false); //true=modal show, false=modal hide

  }

  const deleteData = (rowData) => {
    swal({
      title: "Are you sure?",
      text: "Once deleted, you will not be able to recover this data!",
      icon: "warning",
      buttons: {
        confirm: {
          text: "Yes",
          value: true,
          visible: true,
          className: "",
          closeModal: true,
        },
        cancel: {
          text: "No",
          value: null,
          visible: true,
          className: "",
          closeModal: true,
        },
      },
      dangerMode: true,
    }).then((allowAction) => {
      if (allowAction) {
        deleteApi(rowData);
      }
    });
  };

  function deleteApi(rowData) {
 
    let params = {
      action: "deleteData",
      lan: language(),
      UserId: UserInfo.UserId,
      ClientId: UserInfo.ClientId,
      BranchId: UserInfo.BranchId,
      rowData: rowData,
    };

    apiCall.post(serverpage, { params }, apiOption()).then((res) => {
      console.log('res: ', res);
      props.openNoticeModal({
        isOpen: true,
        msg: res.data.message,
        msgtype: res.data.success,
      });
      getDataList();
    });

  }

  return (
    <>
      <div class="bodyContainer">
        {/* <!-- ######-----TOP HEADER-----####### --> */}
        <div class="topHeader">
          <h4>
            <a href="#">Home</a> ❯ Stationary ❯ Product
          </h4>
        </div>

        {/* <!-- TABLE SEARCH AND GROUP ADD --> */}
        <div class="searchAdd">
          {/* <input type="text" placeholder="Search Product Group"/> */}

          <Button label={"Export"} class={"btnPrint"} onClick={PrintPDFExcelExportFunction} />
          <Button disabled={permissionType}  label={"ADD"} class={"btnAdd"} onClick={addData} />

        </div>

        {/* <!-- ####---THIS CLASS IS USE FOR TABLE GRID PRODUCT INFORMATION---####s --> */}
        <div class="subContainer tableHeight">
          <div className="App">
            <CustomTable
              columns={columnList}
              rows={dataList?dataList:{}}
              actioncontrol={actioncontrol}
            />
          </div>
        </div>
      </div>
      {/* <!-- BODY CONTAINER END --> */}


      {showModal && (<ProductAddEditModal masterProps={props} currentRow={currentRow} modalCallback={modalCallback}/>)}


    </>
  );
};

export default Product;