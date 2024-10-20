import React, { forwardRef, useRef, useEffect, useState } from "react";
import { Button } from "../../../components/CustomControl/Button";
import {
  apiCall,
  apiOption,
  LoginUserInfo,
  language,
} from "../../../actions/api";

const UserEntryAddEditModal = (props) => {
  //console.log("props modal: ", props);
  const serverpage = "userentry"; // this is .php server page
  const [currentRow, setCurrentRow] = useState(props.currentRow);
  const [errorObject, setErrorObject] = useState({});
  const [currentFile, setCurrentFile] = useState(null);
  const UserInfo = LoginUserInfo();

  const [DesignationList, setDesignationList] = useState(null);
  const [currDesignationId, setCurrDesignationId] = useState(null);

  const [DepartmentList, setDepartmentList] = useState(null);
  const [BusinessLineList, setBusinessLineList] = useState(null);
  const [currDepartmentId, setCurrDepartmentId] = useState(null);
  const [currBusinessLineId, setCurrBusinessLineId] = useState(null);

  const [TeamList, setTeamList] = useState(null);
  const [currTeamId, setCurrTeamId] = useState(null);

  const [UserList, setUserList] = useState(null);
  const [currLinemanUserId, setCurrLinemanUserId] = useState(null);

  const [RoleList, setRoleList] = useState(null);
  const [currRoleId, setCurrRoleId] = useState(null);

  const baseUrl = process.env.REACT_APP_FRONT_URL;
  const [previewImage, setPreviewImage] = useState(
    `${baseUrl}image/user/placeholder.png`
  );

  const [previewImages, setPreviewImages] = useState({
    PhotoUrl: `${baseUrl}image/user/placeholder.png`,
  });

  React.useEffect(() => {
    getDesignation(props.currentRow.DesignationId);
    getRole(props.currentRow.RoleId);
    getDepartment(props.currentRow.DepartmentId);
    getBusinessLine(props.currentRow.BusinessLineId);
    getTeam(props.currentRow.TeamId);
    getUser(props.currentRow.LinemanUserId);

    // console.log("call useEffect");
  }, []);

  function getDesignation(selectDesignationId) {
    let params = {
      action: "DesignationList",
      lan: language(),
      UserId: UserInfo.UserId,
      ClientId: UserInfo.ClientId,
      BranchId: UserInfo.BranchId,
    };

    apiCall.post("combo_generic", { params }, apiOption()).then((res) => {
      setDesignationList(
        [{ id: "", name: "Select Designation" }].concat(res.data.datalist)
      );

      setCurrDesignationId(selectDesignationId);
    });
  }

  function getRole(selectRoleId) {
    let params = {
      action: "RoleList",
      lan: language(),
      UserId: UserInfo.UserId,
      ClientId: UserInfo.ClientId,
      BranchId: UserInfo.BranchId,
    };

    apiCall.post("combo_generic", { params }, apiOption()).then((res) => {
      setRoleList([{ id: "", name: "Select Role" }].concat(res.data.datalist));

      setCurrRoleId(selectRoleId);
    });
  }

  function getDepartment(selectDepartmentId) {
    let params = {
      action: "DepartmentList",
      lan: language(),
      UserId: UserInfo.UserId,
      ClientId: UserInfo.ClientId,
      BranchId: UserInfo.BranchId,
    };

    apiCall.post("combo_generic", { params }, apiOption()).then((res) => {
      setDepartmentList(
        [{ id: "", name: "Select Department" }].concat(res.data.datalist)
      );

      setCurrDepartmentId(selectDepartmentId);
    });
  }

  function getBusinessLine(selectBusinessLineId) {
    let params = {
      action: "BusinessLineList",
      lan: language(),
      UserId: UserInfo.UserId,
      ClientId: UserInfo.ClientId,
      BranchId: UserInfo.BranchId,
    };

    apiCall.post("combo_generic", { params }, apiOption()).then((res) => {
      setBusinessLineList(
        [{ id: "", name: "Select Business Line" }].concat(res.data.datalist)
      );

      setCurrBusinessLineId(selectBusinessLineId);
    });
  }

  function getTeam(selectTeamId) {
    let params = {
      action: "TeamList",
      lan: language(),
      UserId: UserInfo.UserId,
      ClientId: UserInfo.ClientId,
      BranchId: UserInfo.BranchId,
    };

    apiCall.post("combo_generic", { params }, apiOption()).then((res) => {
      setTeamList([{ id: "", name: "Select Team" }].concat(res.data.datalist));

      setCurrTeamId(selectTeamId);
    });
  }

  function getUser(selectLinemanUserId) {
    let params = {
      action: "UserList",
      lan: language(),
      UserId: UserInfo.UserId,
      ClientId: UserInfo.ClientId,
      BranchId: UserInfo.BranchId,
    };

    apiCall.post("combo_generic", { params }, apiOption()).then((res) => {
      setUserList([{ id: "", name: "Select User" }].concat(res.data.datalist));

      setCurrLinemanUserId(selectLinemanUserId);
    });
  }

  /*  const handleChange = (e) => {
    const { name, value } = e.target;
    let data = { ...currentRow };
    data[name] = value;
    setCurrentRow(data);
    // console.log('aaa data: ', data);

    setErrorObject({ ...errorObject, [name]: null });

  }; */

  const handleChange = (e) => {
    const { name, value } = e.target;
    let data = { ...currentRow };
    data[name] = value;

    setCurrentRow(data);

    setErrorObject({ ...errorObject, [name]: null });

    if (name === "DesignationId") {
      setCurrDesignationId(value);
    }

    if (name === "RoleId") {
      setCurrRoleId(value);
    }
    if (name === "DepartmentId") {
      setCurrDepartmentId(value);
    }

    if (name === "BusinessLineId") {
      setCurrBusinessLineId(value);
    }


    if (name === "TeamId") {
      setCurrTeamId(value);
    }

    if (name === "LinemanUserId") {
      setCurrLinemanUserId(value);
    }
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
    // console.log("--------", currentRow);

    // let validateFields = ["UserName", "DiscountAmount", "DiscountPercentage"]
    let validateFields = [];
    if (currentRow["id"]) {
      validateFields = [
        "UserName",
        "LoginName",
        "Email",
        "DesignationId",
        "RoleId",
        "DepartmentId",
        "BusinessLineId",
      ];
    } else {
      validateFields = [
        "UserName",
        "LoginName",
        "Password",
        "Email",
        "DesignationId",
        "RoleId",
        "DepartmentId",
        "BusinessLineId",
      ];
    }

    let errorData = {};
    let isValid = true;
    validateFields.map((field) => {
      if (!currentRow[field]) {
        errorData[field] = "validation-style";
        isValid = false;
      }

      let InEdit = "";
      if (currentRow["id"]) {
        InEdit = currentRow["id"];
      } else {
        InEdit = "";
      }

      if (InEdit) {
        errorData["Password"] = "";
      }

      //-----start confirm change password-----
      let cpassword = "";
      let cconfirmChangePassword = "";

      if (currentRow["Password"]) {
        cpassword = currentRow["Password"].trim();
      } else {
        cpassword = "";
      }

      if (currentRow["confirmChangePassword"]) {
        cconfirmChangePassword = currentRow["confirmChangePassword"].trim();
      } else {
        cconfirmChangePassword = "";
      }

      if (cpassword !== "") {
        if (cconfirmChangePassword == "") {
          props.masterProps.openNoticeModal({
            isOpen: true,
            msg: "Enter Confirm Password",
            msgtype: 0,
          });

          //errorData["confirmChangePassword"] = "Enter Confirm Password";
          isValid = false;
        } else if (cpassword != cconfirmChangePassword) {
          props.masterProps.openNoticeModal({
            isOpen: true,
            msg: "Password did not match",
            msgtype: 0,
          });

          //errorData["confirmChangePassword"] = "Password did not match";
          isValid = false;
        } else {
          errorData["confirmChangePassword"] = "";
        }
      }

      //-----end confirm change password-----
    });
    setErrorObject(errorData);
    return isValid;
  };

  function addEditAPICall() {
    if (validateForm()) {
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
        if (res.data.success === 1) {
          props.modalCallback("addedit");
        }
      });
    }
  }

  function modalClose() {
    // console.log("props modal: ", props);
    props.modalCallback("close");
  }

  const handleFileChange = (e, photoType) => {
    e.preventDefault(); // Prevent default form submission behavior
    const file = e.target.files[0];

    if (file) {
      uploadImage(file, photoType, e);
      setPreviewImages((prevImages) => ({
        ...prevImages,
        [photoType]: URL.createObjectURL(file),
      }));
    }
  };

  const uploadImage = (file, photoType) => {
    if (!file) {
      // console.error("No file selected");
      return;
    }

    const formData = new FormData();
    let timestamp = Math.floor(new Date().getTime() / 1000);

    formData.append("baseUrl", baseUrl);
    formData.append("formName", "userProfile");
    formData.append("file", file);
    formData.append("timestamp", timestamp);
    formData.append("filename", `./image/user/${timestamp}_${file.name}`);

    apiCall
      .post("upload-image", formData, apiOption())
      .then((res) => {
        setCurrentRow((prevData) => ({
          ...prevData,
          [photoType]: `${timestamp}_${file.name}`,
        }));
      })
      .catch((error) => {
        console.error("API call error:", error);
      });
  };

  return (
    <>
      {/* <!-- GROUP MODAL START --> */}
      <div id="groupModal" class="modal">
        {/* <!-- Modal content --> */}
        <div class="modal-content">
          <div class="modalHeader">
            <h4>Add/Edit User</h4>
          </div>

          <div class="contactmodalBody pt-10">
            <label>User Name *</label>
            <input
              type="text"
              id="UserName"
              name="UserName"
              class={errorObject.UserName}
              placeholder="Enter User Name"
              value={currentRow.UserName}
              onChange={(e) => handleChange(e)}
            />

            <label>Login Name *</label>
            <input
              type="text"
              id="LoginName"
              name="LoginName"
              class={errorObject.LoginName}
              placeholder="Enter Login Name"
              value={currentRow.LoginName}
              onChange={(e) => handleChange(e)}
            />
          </div>

          <div class="contactmodalBody pt-10">
            <label>Password *</label>
            <input
              id="Password"
              name="Password"
              type="Password"
              class={errorObject.Password}
              placeholder="Enter Password"
              value={currentRow.Password}
              onChange={(e) => handleChange(e)}
            />

            <label>Confirm Password</label>
            <input
              id="confirmChangePassword"
              name="confirmChangePassword"
              type="Password"
              class={errorObject.confirmChangePassword}
              placeholder="Enter Confirm Password"
              value={currentRow.confirmChangePassword}
              onChange={(e) => handleChange(e)}
            />
          </div>

          <div class="contactmodalBody pt-10">
            <label>Email *</label>
            <input
              type="text"
              id="Email"
              name="Email"
              placeholder="Enter Email"
              class={errorObject.Email}
              value={currentRow.Email}
              onChange={(e) => handleChange(e)}
            ></input>

            <label>Phone No</label>
            <input
              type="text"
              id="PhoneNo"
              name="PhoneNo"
              placeholder="Enter Phone No"
              // class={errorObject.PhoneNo}
              value={currentRow.PhoneNo}
              onChange={(e) => handleChange(e)}
            ></input>


          </div>

          <div class="contactmodalBody pt-10">
            
          <label>Role Name *</label>
            <select
              id="RoleId"
              name="RoleId"
              class={errorObject.RoleId}
              value={currRoleId}
              onChange={(e) => handleChange(e)}
            >
              {RoleList &&
                RoleList.map((item, index) => {
                  return <option value={item.id}>{item.name}</option>;
                })}
            </select>
            <label>Designation *</label>
            <select
              id="DesignationId"
              name="DesignationId"
              class={errorObject.DesignationId}
              value={currDesignationId}
              onChange={(e) => handleChange(e)}
            >
              {DesignationList &&
                DesignationList.map((item, index) => {
                  return <option value={item.id}>{item.name}</option>;
                })}
            </select>

          </div>

          <div class="contactmodalBody pt-10">
          {/*  <label>Team</label>
            <select
              id="TeamId"
              name="TeamId"
              value={currTeamId}
              onChange={(e) => handleChange(e)}
            >
              {TeamList &&
                TeamList.map((item, index) => {
                  return <option value={item.id}>{item.name}</option>;
                })}
            </select>*/}
            
            <label>Department *</label>
            <select
              id="DepartmentId"
              name="DepartmentId"
              class={errorObject.DepartmentId}
              value={currDepartmentId}
              onChange={(e) => handleChange(e)}
            >
              {DepartmentList &&
                DepartmentList.map((item, index) => {
                  return <option value={item.id}>{item.name}</option>;
                })}
            </select>

            <label>Business Line *</label>
            <select
              id="BusinessLineId"
              name="BusinessLineId"
              class={errorObject.BusinessLineId}
              value={currBusinessLineId}
              onChange={(e) => handleChange(e)}
            >
              {BusinessLineList &&
                BusinessLineList.map((item, index) => {
                  return <option value={item.id}>{item.name}</option>;
                })}
            </select>


          </div>

          <div class="contactmodalBody pt-10">
           
          <label>Lineman (N+1)</label>
            <select
              id="LinemanUserId"
              name="LinemanUserId"
              // class={errorObject.LinemanUserId}
              value={currLinemanUserId}
              onChange={(e) => handleChange(e)}
            >
              {UserList &&
                UserList.map((item, index) => {
                  return <option value={item.id}>{item.name}</option>;
                })}
            </select>

          <label>Address</label>
            <input
              type="text"
              id="Address"
              name="Address"
              // class={errorObject.Address}
              placeholder="Enter Address"
              value={currentRow.Address}
              onChange={(e) => handleChange(e)}
            />

          </div>

          <div class="contactmodalBody pt-10">

          <label> Is Active?</label>
            <input
              id="IsActive"
              name="IsActive"
              type="checkbox"
              checked={currentRow.IsActive}
              onChange={handleChangeCheck}
            />
          </div>
            


          <div className="contactmodalBody pt-10">
            
            <label>Photo</label>
            <input
              type="file"
              id="PhotoUrl"
              name="PhotoUrl"
              accept="image/*"
              //onChange={handleFileChange}
              onChange={(e) => handleFileChange(e, "PhotoUrl")}
            />

            {previewImages.PhotoUrl && (
              <div className="image-preview">
                <img
                  src={
                    currentRow.PhotoUrl
                      ? `${baseUrl}image/user/${currentRow.PhotoUrl}`
                      : previewImage
                  }
                  alt="Photo"
                  className="preview-image"
                />
              </div>
            )}
          </div>

          {/* 
          <div>
      <input type="file" accept="image/*" onChange={handleImageUpload} />
    </div> */}

          <div class="modalItem">
            <Button label={"Close"} class={"btnClose"} onClick={modalClose} />
            {props.currentRow.id && (
              <Button
                label={"Update"}
                class={"btnUpdate"}
                onClick={addEditAPICall}
              />
            )}
            {!props.currentRow.id && (
              <Button
                label={"Save"}
                class={"btnSave"}
                onClick={addEditAPICall}
              />
            )}
          </div>
        </div>
      </div>
      {/* <!-- GROUP MODAL END --> */}
    </>
  );
};

export default UserEntryAddEditModal;
