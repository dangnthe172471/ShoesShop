/* global XLSX */

var btnXlsx = document.querySelectorAll('.action button')[0];
var btnXls = document.querySelectorAll('.action button')[1];


btnXlsx.onclick = () => exportData('xlsx');
btnXls.onclick = () => exportData('xls');


function exportData(type) {
    const fileName = 'exported-sheet.' + type;
    const table = document.getElementById("table");
    const wb = XLSX.utils.table_to_book(table);
    XLSX.writeFile(wb, fileName);
}