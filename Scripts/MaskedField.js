
var unMaskTimeOutIds = {};

function unMask(txtId, btnId, timeOut) {
    var maskedInput = document.getElementById(txtId);

    maskedInput.removeEventListener('input',extendMaskedFieldTimeout);

    setTimeout(function () {
        addMaskedListener(txtId);
    }, 1000);

    setUnMaskTimeout(txtId, btnId, timeOut);
}

function addMaskedListener(txtId) {
    document.getElementById(txtId).addEventListener('input', extendMaskedFieldTimeout);
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
    //alert('pageLoad from MaskedField.js');
}
