export interface TableModel {
  table: string,
  columns: [],
  tableData: {},
  totalRows: number,
  filter: string,
  start: number,
  client_limit: number,
  server_limit: number,
}
