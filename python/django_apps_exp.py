# fake




# django ajax selects

@register('department')
class DepartmentLookup(LookupChannel):

    model = core_models.Department

    def get_query(self, query, request):
        queries = query.split()
        q = Q()
        for query in queries:
            q.add(Q(name__icontains=query) | Q(site__name__icontains=query), q.connector)
        return self.model.objects.filter(q).order_by('name')



# django-extensions
