import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { CdwdRoutingModule } from './cdwd-routing.module';
import { WrapperComponent } from './components/wrapper/wrapper.component';
import { TablesComponent } from './components/tables/tables.component';
import { AboutComponent } from './components/about/about.component';
import { ReportsComponent } from './components/reports/reports.component';
import { HomeComponent } from './components/home/home.component';

import {MatSidenavModule} from '@angular/material/sidenav';
import {MatIconModule} from '@angular/material/icon';
import {MatListModule} from '@angular/material/list';
import {MatToolbarModule} from '@angular/material/toolbar';
import {MatCardModule} from '@angular/material/card';
import {MatButtonModule} from '@angular/material/button';
import { MatTableModule } from '@angular/material/table';
import {MatPaginatorModule} from '@angular/material/paginator';
import {MatProgressSpinnerModule} from '@angular/material/progress-spinner';
import {MatFormFieldModule} from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatProgressBarModule } from "@angular/material/progress-bar";
import {MatChipsModule} from '@angular/material/chips';
import {MatGridListModule} from '@angular/material/grid-list';
import {MatSelectModule} from '@angular/material/select';
import {MatAutocompleteModule} from '@angular/material/autocomplete';

import { FlexLayoutModule } from '@angular/flex-layout';

import {FormsModule, ReactiveFormsModule} from '@angular/forms'

import { SidenavComponent } from './components/sidenav/sidenav.component';
import { BodyComponent } from './components/body/body.component';
import { TableDisplayComponent } from './components/table-display/table-display.component';
import { TableDataComponent } from './components/table-data/table-data.component';
import { TableFilterComponent } from './components/table-filter/table-filter.component';
import { TableComponent } from './components/table/table.component';


@NgModule({
  declarations: [WrapperComponent, TablesComponent, AboutComponent, ReportsComponent, HomeComponent, SidenavComponent, BodyComponent, TableDisplayComponent, TableDataComponent, TableFilterComponent, TableComponent],
  imports: [
    CommonModule,
    CdwdRoutingModule,

    FormsModule,
    ReactiveFormsModule,

    // NG Material Modules
    MatSidenavModule,
    MatIconModule,
    MatListModule,
    MatToolbarModule,
    MatCardModule,
    MatButtonModule,
    MatTableModule,
    MatPaginatorModule,
    MatProgressSpinnerModule,
    MatFormFieldModule,
    MatInputModule,
    MatProgressBarModule,
    MatChipsModule,
    MatGridListModule,
    MatSelectModule,
    MatAutocompleteModule,

    FlexLayoutModule
  ]
})
export class CdwdModule { }
