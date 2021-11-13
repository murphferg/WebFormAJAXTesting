
var unMaskTimeOutIds = {};
var testingUnMask = {};

function unMask(txtId, btnId, timeOut) {
    // on
    setTimeout(function () {
        document.getElementById(txtId).addEventListener('input', extendMaskedFieldTimeout);
    }, 1000);

    setUnMaskTimeout(txtId, btnId, timeOut);
}

function setUnMaskTimeout(txtId, btnId, timeOut) {
    if (unMaskTimeOutIds[txtId])
        clearTimeout(unMaskTimeOutIds[txtId]);

    unMaskTimeOutIds[txtId] = setTimeout(function () { document.getElementById(btnId).click(); }, timeOut);
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
