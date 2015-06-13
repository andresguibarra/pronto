function button2_OnCLick() {
    var l1 = document.getElementById('Label1');
    var l2 = document.getElementById('Label2');
    var l3 = document.getElementById('Label3');
    var l4 = document.getElementById('Label4');
    l4.textContent = l1.textContent + l2.textContent + l3.textContent;
    return false;
}