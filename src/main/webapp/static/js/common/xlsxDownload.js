function xlsxDownload(rows, title) {
    /* generate worksheet and workbook */
    const worksheet = XLSX.utils.json_to_sheet(rows);
    const workbook = XLSX.utils.book_new();
    XLSX.utils.book_append_sheet(workbook, worksheet, title);

    /* fix headers */
    // XLSX.utils.sheet_add_aoa(worksheet, header, { origin: "A1" });

    /* calculate column width */
    // const max_width = rows.reduce((w, r) => Math.max(w, r.name.length), 10);
    // worksheet["!cols"] = [ { wch: max_width } ];

    /* create an XLSX file and try to save to Books.xlsx */
    let wbout = XLSX.write(workbook, {bookType: 'xlsx', type: 'binary'});

    saveAs(new Blob([s2ab(wbout)], {type: 'application/octet-stream'}), title + '_' + xlsxFormatDate(new Date()) + '.xlsx');
}

function s2ab(s) {
    let buf = new ArrayBuffer(s.length);
    let view = new Uint8Array(buf);
    for (let i = 0; i < s.length; i++) view[i] = s.charCodeAt(i) & 0xFF;
    return buf;
}

let xlsxFormatDate = function (date) {
    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, '0');
    const day = String(date.getDate()).padStart(2, '0');
    const hours = String(date.getHours()).padStart(2, '0');
    const minutes = String(date.getMinutes()).padStart(2, '0');
    return `${year}${month}${day}${hours}${minutes}`;
}