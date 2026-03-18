document.addEventListener('DOMContentLoaded', () => {
    // Initialize CodeMirror
    const editor = CodeMirror(document.getElementById('sql-query'), {
        mode: 'text/x-sql',
        theme: 'material-darker',
        lineNumbers: true,
        lineWrapping: true,
        indentWithTabs: false,
        indentUnit: 2,
        tabSize: 2,
        autofocus: true,
        height: 'auto',
        styleActiveLine: true,
        matchBrackets: true,
        autoCloseBrackets: true,
        placeholder: 'SELECT * FROM TableName...'
    });

    // Set minimum height
    editor.setSize(null, 400);

    const btnExecute = document.getElementById('btn-execute');
    const btnClear = document.getElementById('btn-clear');
    const errorBanner = document.getElementById('error-banner');
    const tableContainer = document.getElementById('table-container');
    const rowCountSpan = document.getElementById('row-count');

    const showError = (message) => {
        errorBanner.textContent = message;
        errorBanner.style.display = 'block';
        tableContainer.innerHTML = '<div class="empty-state">Execute a valid query to see results.</div>';
        rowCountSpan.textContent = '0 rows';
    };

    const hideError = () => {
        errorBanner.style.display = 'none';
    };

    const renderTable = (columns, rows) => {
        if (!columns || columns.length === 0 || !rows || rows.length === 0) {
            tableContainer.innerHTML = '<div class="empty-state">No data returned.</div>';
            rowCountSpan.textContent = '0 rows';
            return;
        }

        rowCountSpan.textContent = `${rows.length} row${rows.length > 1 ? 's' : ''}`;

        const table = document.createElement('table');
        const thead = document.createElement('thead');
        const tbody = document.createElement('tbody');

        // Headers
        const headerRow = document.createElement('tr');
        columns.forEach(col => {
            const th = document.createElement('th');
            th.textContent = col;

            // Add resizer handle
            const resizer = document.createElement('div');
            resizer.className = 'resizer';
            th.appendChild(resizer);

            let x = 0;
            let w = 0;

            const mouseDownHandler = function (e) {
                x = e.clientX;
                const styles = window.getComputedStyle(th);
                w = parseInt(styles.width, 10);

                document.addEventListener('mousemove', mouseMoveHandler);
                document.addEventListener('mouseup', mouseUpHandler);
                resizer.classList.add('resizing');
            };

            const mouseMoveHandler = function (e) {
                const dx = e.clientX - x;
                th.style.width = `${w + dx}px`;
            };

            const mouseUpHandler = function () {
                document.removeEventListener('mousemove', mouseMoveHandler);
                document.removeEventListener('mouseup', mouseUpHandler);
                resizer.classList.remove('resizing');
            };

            resizer.addEventListener('mousedown', mouseDownHandler);

            headerRow.appendChild(th);
        });
        thead.appendChild(headerRow);

        // Rows
        rows.forEach(row => {
            const tr = document.createElement('tr');
            columns.forEach(col => {
                const td = document.createElement('td');
                td.textContent = row[col] !== null ? row[col] : 'NULL';
                if (row[col] === null) {
                    td.style.color = 'var(--text-secondary)';
                    td.style.fontStyle = 'italic';
                }
                tr.appendChild(td);
            });
            tbody.appendChild(tr);
        });

        table.appendChild(thead);
        table.appendChild(tbody);

        tableContainer.innerHTML = '';
        tableContainer.appendChild(table);
    };

    btnExecute.addEventListener('click', async () => {
        const query = editor.getValue().trim();

        if (!query) {
            showError('Please enter an SQL query.');
            return;
        }

        hideError();
        btnExecute.textContent = 'Executing...';
        btnExecute.disabled = true;

        try {
            const response = await fetch('/api/query', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ query })
            });

            const data = await response.json();

            if (!response.ok) {
                showError(data.error || 'Failed to execute query');
            } else {
                renderTable(data.columns, data.rows);
            }
        } catch (err) {
            showError('Network error or server is unreachable. Details: ' + err.message);
        } finally {
            btnExecute.textContent = 'Execute Query';
            btnExecute.disabled = false;
        }
    });

    btnClear.addEventListener('click', () => {
        editor.setValue('');
        hideError();
        tableContainer.innerHTML = '<div class="empty-state">No data to display. Execute a query first.</div>';
        rowCountSpan.textContent = '0 rows';
    });
});
