var unMaskTimeOutIds = {};

function unMask(txtId, btnId, timeOut) {
    setTimeout(function () {
        document.getElementById(txtId).addEventListener('input', extendMaskedFieldTimeout);
    }, 1000);

    setUnMaskTimeout(txtId, btnId, timeOut);
}

function reMask(txtId) {
    clearUnMaskTimeout(txtId);
}

function clearUnMaskTimeout(txtId) {
    if (unMaskTimeOutIds[txtId]) {
        console.log("before clearTimeout(unMaskTimeOutIds[" + txtId + "]:)" + unMaskTimeOutIds[txtId]);
        clearTimeout(unMaskTimeOutIds[txtId]);
        unMaskTimeOutIds[txtId] = null;
        console.log("after clearTimeout(unMaskTimeOutIds[" + txtId + "]:)" + unMaskTimeOutIds[txtId]);
    }
}

function setUnMaskTimeout(txtId, btnId, timeOut) {
    clearUnMaskTimeout(txtId);

    console.log("before setTimeout(unMaskTimeOutIds[" + txtId + "]:)" + unMaskTimeOutIds[txtId]);
    unMaskTimeOutIds[txtId] = setTimeout(function () { document.getElementById(btnId).click(); }, timeOut);
    console.log("after setTimeout(unMaskTimeOutIds[" + txtId + "]:)" + unMaskTimeOutIds[txtId]);
}

function extendMaskedFieldTimeout(source) {
    var maskedInput = document.getElementById(source.target.id);
    var maskedInputData = maskedInput.dataset;

    if (maskedInputData.isMasked == "false") {
        setUnMaskTimeout(maskedInput.id, maskedInputData.lnkbuttonId, maskedInputData.unmaskTimeout);
    }
}

function pageLoad() {
    //change code to turn off progress bar;
}
