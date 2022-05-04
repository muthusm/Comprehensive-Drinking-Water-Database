export const filterFields: any = {
  'pws': {
    'pwsid': 'string',
    'pws_name': 'text',
    'epa_region': 'string',
    'primacy_agency_code':'string',
    'pws_activity_code':'string',
    'pws_type_code': 'string',
    'population_served_count': 'number',
    'state_code': 'string',
    'service_connections_count': 'number'
  },
  'violation': {
    'contaminant_code': 'string',
    'is_health_based_ind': 'string',
    'is_major_viol_ind': 'string',
    'pwsid': 'string',
    'viol_first_reported_date': 'string',
    'viol_last_reported_date': 'string',
    'viol_measure': 'number',
    'violation_code': 'string',
    'violation_category_code': 'string',
    'violation_id': 'string',
    'violation_status': 'string'
  },
  'site_visit': {
    'agency_type_code': 'string',
    'pwsid': 'string',
    'visit_date': 'date',
    'visit_id': 'string',
    'visit_reason_code': 'string'
  },
  'facilities': {
    'availability_code': 'string',
    'facility_activity_code': 'string',
    'facility_deactivation_date': 'date',
    'facility_id': 'string',
    'facility_type_code': 'string',
    'is_source_ind': 'string',
    'pwsid': 'string',
    'submission_status_code': 'string',
    'water_type_code': 'string'
  },
  'pn_violations_assoc': {
    'contaminant_code': 'string',
    'pn_violation_id': 'string',
    'pwsid': 'string',
    'related_violation_id': 'string',
    'violation_code': 'string'
  },
  'events_milestones': {
    'event_actual_date': 'date',
    'event_end_date': 'date',
    'event_milestone_code': 'string',
    'event_reason_code': 'string',
    'event_schedule_id': 'string',
    'pwsid': 'string'
  },
  "geographic_areas": {
    'ansi_entity_code': 'string',
    'area_type_code': 'string',
    'city_served': 'string',
    'county_served': 'string',
    'geo_id': 'string',
    'pwsid': 'string',
    'state_served': 'string',
    'tribal_code': 'string',
    'zip_code_served': 'string'
  },
  "lcr_samples": {
    'contaminant_code': 'string',
    'pwsid': 'string',
    'result_sign_code': 'string',
    'sample_id': 'string',
    'sample_measure': 'number',
    'sampling_end_date': 'date',
    'sampling_start_date': 'date'
  },
  "ansi_areas": {
    'ansi_entity_code': 'number',
    'ansi_state_code': 'number',
    'state_code': 'string'
  }

}

export const FilterFieldsTypes: any = {
  'pwsid': 'string',
  'pws_name': 'text',
  'epa_region': 'string',
  'primacy_agency_code':'string',
  'pws_activity_code':'string',
  'pws_type_code': 'string',
  'population_served_count': 'number',
  'state_code': 'string',
  'service_connections_count': 'number',

  'contaminant_code': 'string',
  'is_health_based_ind': 'string',
  'is_major_viol_ind': 'string',
  'viol_first_reported_date': 'string',
  'viol_last_reported_date': 'string',
  'viol_measure': 'number',
  'violation_code': 'string',
  'violation_category_code': 'string',
  'violation_id': 'string',
  'violation_status': 'string',

  'agency_type_code': 'string',
  'visit_date': 'date',
  'visit_id': 'string',
  'visit_reason_code': 'string',

  'availability_code': 'string',
  'facility_activity_code': 'string',
  'facility_deactivation_date': 'date',
  'facility_id': 'string',
  'facility_type_code': 'string',
  'is_source_ind': 'string',
  'submission_status_code': 'string',
  'water_type_code': 'string',


  'pn_violation_id': 'string',
  'related_violation_id': 'string',

  'event_actual_date': 'date',
  'event_end_date': 'date',
  'event_milestone_code': 'string',
  'event_reason_code': 'string',
  'event_schedule_id': 'string',

  'ansi_entity_code': 'string',
  'area_type_code': 'string',
  'city_served': 'string',
  'county_served': 'string',
  'geo_id': 'string',
  'state_served': 'string',
  'tribal_code': 'string',
  'zip_code_served': 'string',

  'result_sign_code': 'string',
  'sample_id': 'string',
  'sample_measure': 'number',
  'sampling_end_date': 'date',
  'sampling_start_date': 'date',

  'ansi_state_code': 'string',
}
