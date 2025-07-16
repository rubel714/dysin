import React, { forwardRef, useRef,useEffect,useState } from "react";
import {Button}  from "../../../components/CustomControl/Button";
import {apiCall, apiOption, LoginUserInfo, language}  from "../../../actions/api";

const ProductAddEditModal = (props) => { 
  const serverpage = "product"; // this is .php server page

  const [categoryList, setCategoryList] = useState(null);
  const [currentRow, setCurrentRow] = useState([]);
  const [errorObject, setErrorObject] = useState({});
  
   React.useEffect(() => {
    getProductGroup();
  }, []);

  function getProductGroup() {
    let UserInfo = LoginUserInfo();
 
    let params = {
      action: "CategoryList",
      lan: language(),
      UserId: UserInfo.UserId,
      ClientId: UserInfo.ClientId,
      BranchId: UserInfo.BranchId,
      // rowData: rowData,
    };

    apiCall.post("combo_generic", { params }, apiOption()).then((res) => {
      setCategoryList([{id:"", name: "Select category"}].concat(res.data.datalist));
      setCurrentRow(props.currentRow);
    });

  }

  
  const handleChange = (e) => {
    const { name, value } = e.target;
    let data = { ...currentRow };
    data[name] = value;
    setCurrentRow(data);
    // console.log('aaa data: ', data);

    setErrorObject({ ...errorObject, [name]: null });

  };
 
  function handleChangeCheck(e) {
    // console.log('e.target.checked: ', e.target.checked);
    const { name, value } = e.target;

     let data = { ...currentRow };
     data[name] = e.target.checked;
     setCurrentRow(data);
    //  console.log('aaa data: ', data);

  }

  
  const validateForm = () => {

    let validateFields = ["ProductCategoryId","ProductCode","ProductName","ProductShortName","Price"]
    let errorData = {}
    let isValid = true
    validateFields.map((field) => {
      if (!currentRow[field]) {
        errorData[field] = "validation-style";
        isValid = false
      }
    })
    setErrorObject(errorData);
    return isValid
  }


  function addEditAPICall(){

    if (validateForm()) {

      let UserInfo = LoginUserInfo();
      let params = {
        action: "dataAddEdit",
        lan: language(),
        UserId: UserInfo.UserId,
        ClientId: UserInfo.ClientId,
        BranchId: UserInfo.BranchId,
        rowData: currentRow,
      };

      apiCall.post(serverpage, { params }, apiOption()).then((res) => {
        // console.log('res: ', res);
        
        props.masterProps.openNoticeModal({
          isOpen: true,
          msg: res.data.message,
          msgtype: res.data.success,
        });
        
        
        // console.log('props modal: ', props);
        if(res.data.success === 1){
          props.modalCallback("addedit");
        }


      });

    }

    
  }

  function modalClose(){
    console.log('props modal: ', props);
    props.modalCallback("close");
  }


  return (
    <>

      {/* <!-- GROUP MODAL START --> */}
      <div id="groupModal" class="modal">
        {/* <!-- Modal content --> */}
        <div class="modal-content">
          <div class="modalHeader">
            <h4>Add/Edit Product</h4>
          </div>

          <div class="modalItem">
                <label for="">Product Category *</label>
              <select 
                id="ProductCategoryId" 
                name="ProductCategoryId" 
                class={errorObject.ProductCategoryId} 
                value={currentRow.ProductCategoryId}
                onChange={(e) => handleChange(e)}>

                    {categoryList &&
                        categoryList.map(
                        (item, index) => {
                          return ( 
                            <option value={item.id}>{item.name}</option>
                            // <option value="1">AAAAAA</option>
                            // <MenuItem value={item.id}>
                            //   {item.name}
                            // </MenuItem>
                          );
                        })
                        
                        }

                </select>
                {/* <button class="btnPlus">+</button> */}
            </div>

          <div class="modalItem">
            <label>Product Code *</label>
            <input
              type="text"
              id="ProductCode"
              name="ProductCode"
              class={errorObject.ProductCode}
              placeholder="Enter Product Code"
              value={currentRow.ProductCode}
              onChange={(e) => handleChange(e)}
            />
          </div>
          
          <div class="modalItem">
            <label>Product Full Name *</label>
            <input
              type="text"
              id="ProductName"
              name="ProductName"
              class={errorObject.ProductName}
              placeholder="Enter Product Full Name"
              value={currentRow.ProductName}
              onChange={(e) => handleChange(e)}
            />
          </div>
    
          <div class="modalItem">
            <label>Product Short Name *</label>
            <input
              type="text"
              id="ProductShortName"
              name="ProductShortName"
              class={errorObject.ProductShortName}
              placeholder="Enter Product Short Name"
              value={currentRow.ProductShortName}
              onChange={(e) => handleChange(e)}
            />
          </div>

          
          <div class="modalItem">
            <label>Price *</label>
            <input
              type="text"
              id="Price"
              name="Price"
              class={errorObject.Price}
              placeholder="Enter Price"
              value={currentRow.Price}
              onChange={(e) => handleChange(e)}
            />
          </div>

          <div class="modalItem">

            <Button label={"Close"} class={"btnClose"} onClick={modalClose} />
            {props.currentRow.id && (<Button label={"Update"} class={"btnUpdate"} onClick={addEditAPICall} />)}
            {!props.currentRow.id && (<Button label={"Save"} class={"btnSave"} onClick={addEditAPICall} />)}
            
          </div>
        </div>
      </div>
      {/* <!-- GROUP MODAL END --> */}



    </>
  );
};

export default ProductAddEditModal;
