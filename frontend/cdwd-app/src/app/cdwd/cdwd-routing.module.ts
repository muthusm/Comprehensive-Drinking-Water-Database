import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AboutComponent } from './components/about/about.component';
import { HomeComponent } from './components/home/home.component';
import { ReportTableComponent } from './components/report-table/report-table.component';
import { ReportTableResolver } from './components/report-table/report-table.resolver';
import { ReportsComponent } from './components/reports/reports.component';
import { TableDisplayComponent } from './components/table-display/table-display.component';
import { TableFilterComponent } from './components/table-filter/table-filter.component';
import { TableComponent } from './components/table/table.component';
import { TableResolver } from './components/table/table.resolver';
import { TablesComponent } from './components/tables/tables.component';
import { WrapperComponent } from './components/wrapper/wrapper.component';


const routes: Routes = [
  {
    path: '',
    component: WrapperComponent,
    children: [
      {
        path: '',
        redirectTo: 'home',
        pathMatch: 'full'
      },
      {
        path: 'home',
        component: HomeComponent
      },
      {
        path: 'about',
        component: AboutComponent
      },
      {
        path: 'tables',
        component: TablesComponent
      },
      {
        path: 'table/:table_name',
        component: TableComponent,
        resolve: {
          table: TableResolver,
        },
      },
      // {
      //   path: 'table-display',
      //   component: TableDisplayComponent
      // },
      {
        path: 'table-filter/:table_name',
        component: TableFilterComponent
      },
      {
        path: 'reports',
        component: ReportsComponent
      },
      {
        path: 'report-table',
        component: ReportTableComponent,
        resolve: {
          report_table: ReportTableResolver
        }
      }
    ]
  },
  {
    path: '**',
    redirectTo: '',
    pathMatch: 'full'
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class CdwdRoutingModule { }
