import { Group, Paper, SimpleGrid, Text } from '@mantine/core';
import classes from './StatsGrid.module.css';
import { useEffect, useState } from "react";
import { fetchNui } from "../../../../hooks/useNuiEvents";

interface Property {
  job: string;
}

export const Overview = ({job}:Property) => {
  const [stats, setStats] = useState([])
  
  useEffect(() => {
    const fetchData = async() => {
      const resp = await fetchNui("av_business", "admin", {job, type: "overview"})
      if(resp) {
        const data = resp.map((stat:any, index:number) => {
          return (
            <Paper withBorder p="md" radius="md" key={index}>
              <Group justify="space-between">
                <Text size="xs" c="dimmed" className={classes.title}>
                  {stat.label}
                </Text>
              </Group>
              <Group align="flex-end" gap="xs" mt={25}>
                <Text className={classes.value}>{stat.value}</Text>
              </Group>
            </Paper>
          );
        });
        setStats(data)
      }
    }
    fetchData()
  }, [])
  
  return (
    <div className={classes.root}>
      <SimpleGrid cols={{ base: 1, xs: 2, md: 4 }}>{stats}</SimpleGrid>
    </div>
  )
}